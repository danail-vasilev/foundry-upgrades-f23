// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    // We can't have constructor in implementation contract as it modifies the storage of the
    // implementation contract but the storage is kept in the proxy. So we must call initializae func instead.
    // @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        // We don't need that but having it is more verbose
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(); // sets owner to msg.sender
        __UUPSUpgradeable_init(); // usually it's not used, just to know that we are usign UUPSUpgradeable
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
