import * as fs from 'node:fs';
import * as crypto from 'node:crypto';

// Thanks to https://dev.to/saranshk/how-to-get-the-hash-of-a-file-in-nodejs-1bdk
// for the function

export async function getHash(path: string): Promise<string> {
    return new Promise((resolve, reject) => {
        const hash = crypto.createHash('sha256');
        const rs = fs.createReadStream(path);
        rs.on('error', reject);
        rs.on('data', (chunk) => hash.update(chunk));
        rs.on('end', () => resolve(hash.digest('hex')));
    });
}
