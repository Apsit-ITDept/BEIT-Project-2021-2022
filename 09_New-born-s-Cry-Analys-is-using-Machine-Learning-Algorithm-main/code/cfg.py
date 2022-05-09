import os 

Folderpath = "C:\\Users\\manis\\Desktop\\zf\\cry_analysis\\"
# fp1 = os.getcwd()

# print(Folderpath)
# print(fp1)

class Config:
    def __init__(self, mode='conv', nfilt=26, nfeat=13, nfft=512, rate=16000):
        self.mode = mode
        self.nfilt = nfilt
        self.nfeat = nfeat
        self.nfft = nfft
        self.rate = rate
        self.step = int(rate/10)
        self.model_path = os.path.join(Folderpath,'model', mode + '.model')
        self.p_path = os.path.join(Folderpath,'pickles', mode + '.p')