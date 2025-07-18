// SPDX-License-Identifier: BSD-3-Clause-Clear

pragma solidity ^0.8.24;

import "../lib/FHE.sol";

import "./FHEVMConfig.sol";

/// @notice Contract for testing makePubliclyDecryptable and isPubliclyDecryptable functions
contract MakePubliclyDecryptable {
    /// @notice Encrypted unsigned integers of various sizes
    ebool public valueb;
    euint8 public value8;

    /// @notice Constructor to set FHE configuration
    constructor() {
        FHE.setCoprocessor(FHEVMConfig.defaultConfig());
    }

    /// @notice make an ebool publicly decryptable
    function makePubliclyDecryptableBool() public {
        valueb = FHE.asEbool(true);
        FHE.makePubliclyDecryptable(valueb);
    }

    /// @notice check if an ebool is publicly decryptable
    function isPubliclyDecryptableBool() public view returns (bool) {
        return FHE.isPubliclyDecryptable(valueb);
    }

    /// @notice make an euint8 publicly decryptable
    function makePubliclyDecryptableUint8() public {
        value8 = FHE.asEuint8(37);
        FHE.makePubliclyDecryptable(value8);
    }

    /// @notice check if an euint8 is publicly decryptable
    function isPubliclyDecryptableUint8() public view returns (bool) {
        return FHE.isPubliclyDecryptable(value8);
    }
}
