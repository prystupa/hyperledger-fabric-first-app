const shim = require('fabric-shim');

class Chaincode {

    Init(/*stub*/) {
        console.log('Dummy chaincode initialized!');
        return shim.success();
    }

    Invoke(/*stub*/) {
        console.log('Dummy chaincode invoked!');
        return shim.success();
    }
}

shim.start(new Chaincode());
