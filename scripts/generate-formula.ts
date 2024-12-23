import * as handlebars from 'handlebars';
import process from 'node:process';
import * as path from 'node:path';
import { getHash } from './hash-file';
import { FormulaTemplate } from './formula-template';
import * as fs from 'fs/promises';

export async function run() {
    const versionArg = process.argv.find((arg) => arg.includes('--version='));
    const identifierArg = process.argv.find((arg) => arg.includes('--identifier='));
    const pathToBuildDirectory = process.argv.find((arg) => arg.includes('--build-directory='));
    if (!versionArg) {
        throw new Error('Invalid version argument, please pass the version in using --version=vX.X.X');
    }
    if (!identifierArg) {
        throw new Error('Invalid identifier argument, please pass the identifier argument using --identifier=abc123');
    }
    if (!pathToBuildDirectory) {
        throw new Error(
            'Invalid path to build directory, please pass the path to the build directory using --build-directory=/path/to/build/dir',
        );
    }
    const version = versionArg.replace('--version=', '');
    const identifier = identifierArg.replace('--identifier=', '');
    const buildDirectory = pathToBuildDirectory.replace('--build-directory=', '');
    console.log(`Generating new template`);
    console.log(`  [+] version ${version}`);
    console.log(`  [+] identifier ${identifier}`);
    console.log(`  [+] path to build directory ${buildDirectory}`);

    const [darwin_x64_hash, darwin_arm64_hash, linux_x64_hash, linux_arm64_hash] = await Promise.all([
        getHash(path.join(buildDirectory, `brrelease-v${version}-${identifier}-darwin-x64.tar.xz`)),
        getHash(path.join(buildDirectory, `brrelease-v${version}-${identifier}-darwin-arm64.tar.xz`)),
        getHash(path.join(buildDirectory, `brrelease-v${version}-${identifier}-linux-x64.tar.xz`)),
        getHash(path.join(buildDirectory, `brrelease-v${version}-${identifier}-linux-arm64.tar.xz`)),
    ]);

    const formulaTemplate = handlebars.compile(FormulaTemplate);
    const formula = formulaTemplate({
        version,
        identifier,
        darwin_x64_hash,
        darwin_arm64_hash,
        linux_x64_hash,
        linux_arm64_hash,
    });

    const formulaPath = path.resolve('./', 'Formula', 'brrelease.rb');
    await fs.writeFile(formulaPath, formula);

    console.log(`  [+] Successfully updated ${formulaPath}`);
}

run()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
