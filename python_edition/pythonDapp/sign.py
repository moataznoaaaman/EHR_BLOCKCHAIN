import json
from web3 import Web3, HTTPProvider
from web3.contract import ConciseContract
from cryptography.fernet import Fernet

# compile your smart contract with truffle first
truffleFile = json.load(open(r'C:\Users\mo7amad mo3taz\Desktop\security project\python_edition\pythonDapp\build\contracts\Greeter.json'))
abi = truffleFile['abi']
bytecode = truffleFile['bytecode']

# web3.py instance
w3 = Web3(HTTPProvider("HTTP://127.0.0.1:7545")) #modify
print(w3.isConnected())
contract_address = Web3.toChecksumAddress("0xcFED4C04D09676B0e94bf52fe986E419478f4155") #modify

# my information (used to sign, encrypt , hash) a transaction
me = w3.eth.accounts[1] # address
print(me)
priv_key = "a2f49f40901545cc550295884c15782652d2e847fdec80e4e58bde2a10c096da" #private key
enc_key = Fernet.generate_key()
fernet = Fernet(enc_key)

# patient information
patient_id = '1'
patient_name = 'ahmed'
patient_age = '12'

data = patient_name + "#" + patient_age
encMessage = fernet.encrypt(data.encode())

print(data,encMessage)


# Instantiate contract instance to add modify or display data 
contract = w3.eth.contract(abi=abi, bytecode=bytecode)
contract_instance = w3.eth.contract(abi=abi, address=contract_address)
print(contract_instance.functions.greet().call())


# making sure that the transaction is published 
# tx_hash = contract_instance.functions.setGreeting('laaa').transact({
#     'from': me,
#     'nonce': w3.eth.getTransactionCount(me),
#     'gas': 1728712,
#     'gasPrice': w3.toWei('21', 'gwei')})
# # Wait for transaction to be mined
# w3.eth.waitForTransactionReceipt(tx_hash)
# # Display the new greeting value
# print('Updated contract greeting: {}'.format(
#     contract_instance.functions.greet().call()
# ))
