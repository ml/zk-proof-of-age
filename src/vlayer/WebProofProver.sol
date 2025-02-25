// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Strings} from "@openzeppelin-contracts-5.0.1/utils/Strings.sol";

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Prover} from "vlayer-0.1.0/Prover.sol";
import {Web, WebProof, WebProofLib, WebLib} from "vlayer-0.1.0/WebProof.sol";

contract WebProofProver is Prover {
    using Strings for string;
    using WebProofLib for WebProof;
    using WebLib for Web;

    string public constant DATA_URL =
        "https://www.mobywatel.gov.pl/profil/mydata/pesel";

    function main(
        WebProof calldata webProof,
        address account
    ) public view returns (Proof memory, string memory, address) {
        Web memory web = webProof.verify(DATA_URL);

        string birthDateString screenName = web.jsonGetString("screen_name");

        return (proof(), screenName, account);
    }
}
