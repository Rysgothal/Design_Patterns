import { SystemUserProxy } from "./system-user/system-user-proxy";

async function clientCode(): Promise<void> {
    const user = new SystemUserProxy('Lucas', 'LucasFrade');
    console.log('Irá durar 2 segundos');
    console.log(await user.getAddresses());

    console.log('Repetindo novamente (CACHE)');

    for (let i = 0; i <5; i++){
        console.log(await user.getAddresses());
    }
}

clientCode();


