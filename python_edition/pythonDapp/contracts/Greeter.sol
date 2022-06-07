pragma solidity >=0.4.22 <0.9.0;
contract Greeter{

    string public greeting;


    string[] in_clinic_records;
    //clinic1 address, clinic1 registered_patients, clinic1 records
    address clinic1_address;
    string[] clinic1_records;
    mapping(string => bool) public clini1_patients;


    //clinic2 address, clinic2 registered_patients, clinic2 records
    address clinic2_address;
    string[] clinic2_records;
    mapping(string => bool) public clini2_patients;


    //clinic3 address, clinic3 registered_patients, clinic3 records
    address clinic3_address;
    string[] clinic3_records;
    mapping(string => bool) public clini3_patients;


    // used for splitting a string
    bytes tempNum;
    string id;
    // ------------------------

        constructor() public {
             greeting = 'Hello';
             clinic1_address = 0xA18701FcEfcB34548e3F1168018072acFceD24A3;
             clinic2_address = 0x76d4fCF227AF4A6464F093566eD980Dfe7227CB8;
             clinic3_address = 0x042607F7A3CeD2E6014D0B23E869EDD5471a54bc;
         }

        function add_patient(string memory _message, bytes32 hashed_message, uint8 v, bytes32 r, bytes32 s) public {

            bytes32 messageHash = getMessageHash(_message);
            bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
            address retrived_address = ret_add(ethSignedMessageHash, v, r, s);

            // making sure that the message was not manipulated
            require(keccak256(abi.encodePacked(_message)) == hashed_message, 'message has been alterd');
            // making sure that the sender correspond to the address
            require(retrived_address == msg.sender, 'address dont match');
            if(msg.sender == clinic1_address) {   

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(!clini1_patients[id], 'patient already exist');
                //add the patient record to the clinic records
                clinic1_records.push(_message);
                // patient added
                clini1_patients[id] = true;
                greeting = '1';

            } else if(msg.sender == clinic2_address){

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(!clini2_patients[id], 'patient already exist');
                //add the patient record to the clinic records
                clinic2_records.push(_message);
                // patient added
                clini2_patients[id] = true;
                greeting = '2';

            } else {
                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(!clini3_patients[id], 'patient already exist');
                //add the patient record to the clinic records
                clinic3_records.push(_message);
                // patient added
                clini3_patients[id] = true;
                greeting = '3';
            }       
                
        }

        function add_reg_visit(string memory _message, bytes32 hashed_message, uint8 v, bytes32 r, bytes32 s) public {

            bytes32 messageHash = getMessageHash(_message);
            bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
            address retrived_address = ret_add(ethSignedMessageHash, v, r, s);

            // making sure that the message was not manipulated
            require(keccak256(abi.encodePacked(_message)) == hashed_message, 'message has been alterd');
            // making sure that the sender correspond to the address
            require(retrived_address == msg.sender, 'address dont match');
            
            if(msg.sender == clinic1_address) {   

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is registered
                require(clini1_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic1_records.push(_message);
                
                greeting = '2-1';

            } else if(msg.sender == clinic2_address){

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(clini2_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic2_records.push(_message);
                
                greeting = '2-2';

            } else {
                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(clini3_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic3_records.push(_message);
                
                greeting = '2-3';
            }       
            
        }

        function add_lab_visit(string memory _message, bytes32 hashed_message, uint8 v, bytes32 r, bytes32 s) public {

            bytes32 messageHash = getMessageHash(_message);
            bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
            address retrived_address = ret_add(ethSignedMessageHash, v, r, s);

            // making sure that the message was not manipulated
            require(keccak256(abi.encodePacked(_message)) == hashed_message, 'message has been alterd');
            // making sure that the sender correspond to the address
            require(retrived_address == msg.sender, 'address dont match');

            if(msg.sender == clinic1_address) {   

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is registered
                require(clini1_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic1_records.push(_message);
                
                greeting = '3-1';

            } else if(msg.sender == clinic2_address){

                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(clini2_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic2_records.push(_message);
                
                greeting = '3-2';

            } else {
                // fetch the patient id
                splitStr(_message, '#');
                // make sure that this patient is not registered
                require(clini3_patients[id], 'patient does not exist');
                //add the patient record to the clinic records
                clinic3_records.push(_message);
                
                greeting = '3-3';
            }       
            
        }

        function define_records(string memory _message, bytes32 hashed_message, uint8 v, bytes32 r, bytes32 s) public{

            bytes32 messageHash = getMessageHash(_message);
            bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
            address retrived_address = ret_add(ethSignedMessageHash, v, r, s);

            // making sure that the message was not manipulated
            require(keccak256(abi.encodePacked(_message)) == hashed_message, 'message has been alterd');
            // making sure that the sender correspond to the address
            require(retrived_address == msg.sender, 'address dont match');

            if(msg.sender == clinic1_address) {  

                require(clini1_patients[_message], 'patient does not exist');
                in_clinic_records = clinic1_records;

            } else if(msg.sender == clinic2_address){

                require(clini2_patients[_message], 'patient does not exist');
                in_clinic_records = clinic2_records;

            } else {
                require(clini3_patients[_message], 'patient does not exist');
                in_clinic_records = clinic3_records;
            }       
            
        }

        function retrive_records() public returns (string[] memory)
        {
            return in_clinic_records;
        }

        //////////////////////////////////////////// helpers ////////////////////////////////////////////////
        function ret_add(bytes32 _ethSignedMessageHash, uint8 v, bytes32 r, bytes32 s) public returns(address)
        {
            return ecrecover(_ethSignedMessageHash, v, r, s);
        }


        function greet() view public returns (string memory) {
             return greeting;
        }


        function check1() view public returns (string memory ) {
             return clinic1_records[0];
        }

        function check2(string memory _message) view public returns (bool) {
             return clini1_patients[_message];
        }

        function getMessageHash(
                string memory _message
            ) public pure returns (bytes32) {
                return keccak256(abi.encodePacked(_message));
            }

        function getEthSignedMessageHash(bytes32 _messageHash)
            public
            pure
            returns (bytes32)
        {
            return
                keccak256(
                    abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash)
                );
        }

        
        function splitStr(string memory str, string memory delimiter) public { //delimiter can be any character that separates the integers 

        bytes memory b = bytes(str); //cast the string to bytes to iterate
        bytes memory delm = bytes(delimiter);
        
        for(uint i; i<b.length ; i++){          

            if(b[i] != delm[0]) { //check if a not space
                tempNum.push(b[i]);             
            }
            else { 
                id = string(tempNum);
                tempNum = "";   //reset the tempNum to catch the net number        
                return;         
            }                
        }
        }
}