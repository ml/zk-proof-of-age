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
    ) public view returns (Proof memory, address) {
        Web memory web = webProof.verify(DATA_URL);

        string memory birthDateString = web.jsonGetString("birthDate");

        require(
            calculateYearsPassedSimple(birthDateString) >= 18,
            "You must be at least 18 years old"
        );

        return (proof(), account);
    }

    function calculateYearsPassedSimple(
        string memory dateString
    ) internal view returns (uint256) {
        // Parse ISO 8601 date format (YYYY-MM-DDT00:00:00)
        bytes memory dateBytes = bytes(dateString);
        require(dateBytes.length >= 4, "Invalid date format"); // Need at least 4 chars for year

        // Validate each character is a digit and convert to uint
        for (uint i = 0; i < 4; i++) {
            require(
                uint8(dateBytes[i]) >= 48 && uint8(dateBytes[i]) <= 57,
                "Invalid year digit"
            );
        }

        // Extract birth year safely
        uint256 birthYear;
        unchecked {
            uint256 d1 = uint256(uint8(dateBytes[0]) - 48);
            uint256 d2 = uint256(uint8(dateBytes[1]) - 48);
            uint256 d3 = uint256(uint8(dateBytes[2]) - 48);
            uint256 d4 = uint256(uint8(dateBytes[3]) - 48);

            birthYear = d1 * 1000 + d2 * 100 + d3 * 10 + d4;
        }

        // Calculate current year from timestamp (seconds since 1970)
        uint256 currentYear = 1970 + (block.timestamp / 31536000); // 31536000 = seconds in a year

        // Ensure birth year is valid
        require(
            birthYear >= 1970 && birthYear <= currentYear,
            "Invalid birth year"
        );

        // Calculate difference
        return currentYear - birthYear;
    }
}
