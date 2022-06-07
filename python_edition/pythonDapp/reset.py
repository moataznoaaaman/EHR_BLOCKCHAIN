from cryptography.fernet import Fernet
import pickle

# enc_key = Fernet.generate_key()

# with open("c3_enc.pickle", "wb") as outfile:
#  	# "wb" argument opens the file in binary mode
# 	pickle.dump(enc_key, outfile)


with open("c1_v_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

with open("c2_v_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

with open("c3_v_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

with open("c1_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

with open("c2_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

with open("c3_count.pickle", "wb") as outfile:
 	# "wb" argument opens the file in binary mode
	pickle.dump(0, outfile)

