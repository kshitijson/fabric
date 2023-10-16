'use strict';

const { Contract } = require('fabric-contract-api');

class EPBContract extends Contract {

    async InitLedger(ctx) {
        // Initialize any ledger data if needed
    }

    async insertEvidence(ctx, id, caseNo, caseName, fileName, fileType, fileHash) {
        const existing = await ctx.stub.getState(id);
        if (existing && existing.length > 0) {
            throw new Error(`Evidence with ID ${id} already exists`);
        }

        const evidence = {
            id,
            caseNo,
            caseName,
            fileName,
            fileType,
            fileHash,
        };

        await ctx.stub.putState(id, Buffer.from(JSON.stringify(evidence)));
    }

    async viewEvidence(ctx, caseNo) {
        const queryString = {
            selector: {
                caseNo: caseNo
            }
        };

        const queryResults = await this.getQueryResultForQueryString(ctx, JSON.stringify(queryString));
        return queryResults;
    }

    async getQueryResultForQueryString(ctx, queryString) {
        const iterator = await ctx.stub.getQueryResult(queryString);

        const results = [];
        while (true) {
            const res = await iterator.next();

            if (res.value && res.value.value.toString()) {
                const value = res.value.value.toString('utf8');
                try {
                    const parsedValue = JSON.parse(value);
                    results.push(parsedValue);
                } catch (err) {
                    console.log(err);
                }
            }

            if (res.done) {
                await iterator.close();
                return results;
            }
        }
    }
}

module.exports = EPBContract;
