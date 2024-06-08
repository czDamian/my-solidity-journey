// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//@author Damian 
//@notice This shows an example of how structs are used in solidity


contract Structs{
    struct Profile{
        uint8 myId;
        string username;
        string AboutMe;
        address myWalletAddress;
    }
    Profile public myProfile = Profile({
        myId: 1, 
        username: "Damian", 
        AboutMe:" just another dev", 
        myWalletAddress: 0xd16B472C1b3AB8bc40C1321D7b33dB857e823f01
    });

}

contract ArrayWithStruct{
    struct UserProfile{
        uint8 id;
        string name;
        string bio;
    }
    UserProfile[] public listOfProfiles;

    function createProfile (uint8 _id, string memory _name, string memory _bio) public{
        UserProfile memory newUserProfile = UserProfile(
            {
                id: _id,
                name: _name,
                bio: _bio
            }
        );
        listOfProfiles.push(newUserProfile);
        
    }
}
