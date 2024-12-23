import * as handlebars from 'handlebars';
import process from 'node:process';

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
}

run()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
