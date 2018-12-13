const Gateway = artifacts.require("./EIP20Gateway.sol")
    , BN = require('bn.js');
const MockOrganization = artifacts.require('MockOrganization.sol');

const Utils = require('../../../test/test_lib/utils');

const NullAddress = "0x0000000000000000000000000000000000000000";
contract('EIP20Gateway.deactivateGateway()', function (accounts) {

    let gateway;
    let owner = accounts[2];
    let worker = accounts[3];
    let coGateway = accounts[5];
    let organization;
    let burner = NullAddress;

    beforeEach(async function () {

        let mockToken = accounts[0],
            baseToken = accounts[1],
            coreAddress = accounts[2],
            bountyAmount = new BN(100);

        organization = await MockOrganization.new(owner, worker);

        gateway = await Gateway.new(
            mockToken,
            baseToken,
            coreAddress,
            bountyAmount,
            organization.address,
            burner
        );

        await gateway.activateGateway(coGateway, { from: owner });

    });

    it('should deactivate if activated', async function () {

        let isSuccess = await gateway.deactivateGateway.call({ from: owner });

        assert.strictEqual(
            isSuccess,
            true,
            "Gateway deactivation failed, deactivateGateway returned false.",
        );

        await gateway.deactivateGateway({ from: owner });
        let isActivated = await gateway.activated.call();

        assert.strictEqual(
            isActivated,
            false,
            'Activation flag is true but expected as false.'
        );
    });

    it('should not deactivate if already deactivated', async function () {

        await gateway.deactivateGateway({ from: owner });
        await Utils.expectRevert(
            gateway.deactivateGateway.call({ from: owner }),
            'Gateway is already deactivated.'
        );
    });

    it('should deactivated by organization only', async function () {

        await Utils.expectRevert(
            gateway.deactivateGateway.call({ from: accounts[0] }),
            'Only the organization is allowed to call this method.'
        );
    });

});
