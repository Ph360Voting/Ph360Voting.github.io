pragma solidity ^0.4.17;
// written for Solidity version 0.4.18 and above that doesnt break functionality

contract Voting {

    enum Restriction {None, Country}
    struct Ballot {
        address creator;
        bool exists;
        bool active;
        uint length;
        uint numOfCands;
        Restriction restriction;  // the restrictions that can be applied to voting
        bytes32[] candidates;
        uint[] voteCount;
    }
    mapping (bytes32 => Ballot) ballots; // unique ID that will be used to identify the Ballot

    // a function to create a ballot
    function createBallot(bytes32 ballotID, uint len, uint numOfCands, bytes32[] cands, uint[] votes) public { 
        Restriction rest = Restriction.None;
        ballots[ballotID] = Ballot(msg.sender, true, true, len, numOfCands, rest, cands, votes);
    }


    /* SETTER FUNCTIONS */

    // set ballot to be over
    function setEndedBallot(bytes32 ballotID) public returns (bool) {
        if (msg.sender == ballots[ballotID].creator) {
            ballots[ballotID].active = false;
            return true;
        }
        else
            return false;
    }

    // add vote
    function addVote(bytes32 ballotID, uint index) public returns (bool) {
        ballots[ballotID].voteCount[index]++;
    }
    
    /* CHECKING FUNCTIONS */

    // a view function to see if a ballot exists
    function confirmBallot(bytes32 ballotID) public view returns (bool) {
        if (ballots[ballotID].exists == true)
            return true;
        else
            return false;
    }

    // a vew function to see if a ballot is still active
    function checkActiveBallot(bytes32 ballotID) public view returns (bool) {
        if (ballots[ballotID].active)
            return true;
        else
            return false;
    }


    /* GETTER FUNCTIONS */

    // a view function of the length of candidate list
    function getCandidateSize(bytes32 ballotID) public view returns (uint) {
        return( ballots[ballotID].numOfCands);
    }

    // a view function to access a ballots candidates
    function getCandidateInfo(bytes32 ballotID) public view returns (bytes32[]) {
        return( ballots[ballotID].candidates);
    }

    // a view function to access a ballots candidates
    function getVotingInfo(bytes32 ballotID) public view returns (uint[]) {
        return( ballots[ballotID].voteCount);
    }
}
