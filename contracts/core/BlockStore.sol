pragma solidity ^0.4.23;

// Copyright 2018 OpenST Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import "./BlockStoreInterface.sol";

/** @title A block store stores blocks of a block chain. */
contract BlockStore is BlockStoreInterface {

    /**
     * @notice Report a block.
     *
     * @param _blockHeaderRlp The header of the reported block, RLP encoded.
     */
    function reportBlock(
        bytes _blockHeaderRlp
    )
        external
        returns (bool success_)
    {
        revert("This method is not implemented.");
    }

    /**
     * @notice Marks a block in the block store as justified. The source and
     *         the target are required to know when a block is finalised.
     *         Only the polling place may call this method.
     *
     * @param _sourceBlockHash The block hash of the source of the super-
     *                         majority link.
     * @param _targetBlockHash The block hash of the block that is justified.
     */
    function justify(
        bytes32 _sourceBlockHash,
        bytes32 _targetBlockHash
    )
        external
    {
        revert("This method is not implemented.");
    }

    /**
     * @notice Returns the state root of the block that is stored at the given
     *         height. The height must be <= the height of the latest finalised
     *         checkpoint.
     *
     * @param _height The blockheight.
     *
     * @return The state root of the block at the given height.
     */
    function stateRoot(
        uint256 _height
    )
        external
        view
        returns (bytes32 stateRoot_)
    {
        revert("This method is not implemented.");
    }

    /**
     * @notice Returns the height of the latest block that has been finalised.
     *
     * @return The height of the latest finalised block.
     */
    function latestBlockHeight()
        external
        view
        returns (uint256 height_)
    {
        revert("This method is not implemented.");
    }

    /**
     * @notice Validates a given vote. For a vote to be valid:
     *         - The hashes must exist and
     *         - The blocks of the hashes must be at checkpoint heights and
     *         - The source checkpoint must be justified
     *
     * @param _transitionHash The hash of the transition object of the related
     *                        meta-block. Depends on the source block.
     * @param _sourceBlockHash The hash of the source checkpoint of the vote.
     * @param _targetBlockHash The hash of teh target checkpoint of the vote.
     *
     * @return `true` if all of the above apply and therefore the vote is
     *         considered valid by the block store. `false` otherwise.
     */
    function isVoteValid(
        bytes32 _transitionHash,
        bytes32 _sourceBlockHash,
        bytes32 _targetBlockHash
    )
        external
        view
        returns (bool valid_)
    {
        revert("This method is not implemented.");
    }
}
