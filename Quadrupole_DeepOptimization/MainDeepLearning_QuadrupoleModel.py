# =========================================================================
# UNIVERSIDADE FEDERAL DO PARÁ
# INSTITUTO DE TECNOLOGIA
# ENGENHARIA ELÉTRICA
# LABORATÓRIO DE NANOFOTÔNICA E NANOELETRÔNICA
#
# LUIZ HENRIQUE P. ASSUNÇÃO
# =========================================================================


import numpy as np
import pandas as pd

#from keras.layers import Input, Embedding, LSTM, Dense
#from keras.models import Model

#from tensorflow.python.keras import Sequential
#from tensorflow.python.keras.layers import Dense

#from tensorflow._api.v1.keras import Sequential
#from tensorflow._api.v1.keras.layers import Dense


from tensorflow.keras.models import Sequential, Model
from tensorflow.keras.layers import Dense, Concatenate, Input, LSTM, Embedding, Add, LeakyReLU
from sklearn.model_selection import train_test_split
from pprint import pprint
import matplotlib.pyplot as plt
from tensorflow.keras.utils import plot_model
#from keras.layers.merge import Add
#from tensorflow.keras.merge import Add
#from keras.engine.training import Model
#from keras.engine.input_layer import Input
#from keras.layers.merge import Concatenate


class Deep_learning_settings:
    def __init__(
        self,
        dataSetIn_csv="NormalizedDataSetIn.csv",
        dataSetOut_csv="NormalizedDataSetOut.csv",
        dataSetTarget_csv="NormalizedDataSetTarget.csv",
    ):
        print("\n\n")
        print("\n*   *   *   Initialized Dataset Settings   *   *   *")
        self.load_dataSet(dataSetIn_csv, dataSetOut_csv, dataSetTarget_csv)
        print("\n\n*   *   *   Loaded Dataset   *   *   *")
        print("\n\n")
        self.split_dataSet()

    def load_dataSet(self, dataSetIn_csv, dataSetOut_csv, dataSetTarget_csv):
        dataframeIn = pd.read_csv(dataSetIn_csv, header=None)
        datasetIn = dataframeIn.values
        self.X = datasetIn.astype(float)

        dataframeOut = pd.read_csv(dataSetOut_csv, header=None)
        datasetOut = dataframeOut.values
        self.Y = datasetOut.astype(float)

        dataframeTarget = pd.read_csv(dataSetTarget_csv, header=None)
        datasetTarget = dataframeTarget.values
        self.Z = datasetTarget.astype(float)

    def split_dataSet(self, seed=10, random=True):
        # Split data set into train and test
        self.X_train, self.X_test, self.Y_train, self.Y_test = train_test_split(
            self.X,
            self.Y,
            test_size=0.1,
            random_state=seed,
            shuffle=random
        )
        # Split train into train and validation
        self.X_train, self.X_val, self.Y_train, self.Y_val = train_test_split(
            self.X_train,
            self.Y_train,
            test_size=0.1,
            random_state=seed,
            shuffle=random,
        )

        self.Z_target = self.Z

    def extract_trainValTestRes(self):
        return (
            self.X_train,
            self.X_val,
            self.X_test,
            self.Y_train,
            self.Y_val,
            self.Y_test,
            self.Z_target,
        )


class Direct_network:
    def __init__(self):
        datasetManager = Deep_learning_settings()
        self.X_train, self.X_val, self.X_test, self.Y_train, self.Y_val, self.Y_test, self.Z_target = (
            datasetManager.extract_trainValTestRes()
        )

    def baseline_model(self):



        inTen_1 = Input(shape=[51])
        inTen_2 = Input(shape=[51])
        inTen_3 = Input(shape=[51])
        inTen_4 = Input(shape=[51])
        inTen_5 = Input(shape=[51])
        inTen_6 = Input(shape=[51])
        inTen_7 = Input(shape=[51])
        inTen_8 = Input(shape=[51])
        inTen_9 = Input(shape=[51])


        input_1 = Dense(51, input_dim=51)(inTen_1)
        in_1 = LeakyReLU(alpha=0.3)(input_1)
        in_1 = Dense(51)(in_1)
        #in_1 = Dense(51)(in_1)
        #in_1 = Dense(51)(in_1)


        input_2 = Dense(51, input_dim=51)(inTen_2)
        in_2 = LeakyReLU(alpha=0.3)(input_2)
        in_2 = Dense(51)(in_2)
        #in_2 = Dense(51)(in_2)
        #in_2 = Dense(51)(in_2)


        input_3 = Dense(51, input_dim=51)(inTen_3)
        in_3 = LeakyReLU(alpha=0.3)(input_3)
        in_3 = Dense(51)(in_3)
        #in_3 = Dense(51)(in_3)
        #in_3 = Dense(51)(in_3)


        input_4 = Dense(51, input_dim=51)(inTen_4)
        in_4 = LeakyReLU(alpha=0.3)(input_4)
        in_4 = Dense(51)(in_4)
        #in_4 = Dense(51)(in_4)
        #in_4 = Dense(51)(in_4)


        input_5 = Dense(51, input_dim=51)(inTen_5)
        in_5 = LeakyReLU(alpha=0.3)(input_5)
        in_5 = Dense(51)(in_5)
        #in_5 = Dense(51)(in_5)
        #in_5 = Dense(51)(in_5)


        input_6 = Dense(51, input_dim=51)(inTen_6)
        in_6 = LeakyReLU(alpha=0.3)(input_6)
        in_6 = Dense(51)(in_6)
        #in_6 = Dense(51)(in_6)
        #in_6 = Dense(51)(in_6)


        input_7 = Dense(51, input_dim=51)(inTen_7)
        in_7 = LeakyReLU(alpha=0.3)(input_7)
        in_7 = Dense(51)(in_7)
        #in_7 = Dense(51)(in_7)
        #in_7 = Dense(51)(in_7)


        input_8 = Dense(51, input_dim=51)(inTen_8)
        in_8 = LeakyReLU(alpha=0.3)(input_8)
        in_8 = Dense(51)(in_8)
        #in_8 = Dense(51)(in_8)
        #in_8 = Dense(51)(in_8)


        input_9 = Dense(51, input_dim=51)(inTen_9)
        in_9 = LeakyReLU(alpha=0.3)(input_9)
        in_9 = Dense(51)(in_9)
        #in_9 = Dense(51)(in_9)
        #in_9 = Dense(51)(in_9)



        #concatenate_model = Add()([in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9])

        concatenate_model = Concatenate(axis=-1)([in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9])
        concatenate_model = LeakyReLU(alpha=0.3)(concatenate_model)
        concatenate_model = Dense(300, name='Output1')(concatenate_model)
        concatenate_model = LeakyReLU(alpha=0.3)(concatenate_model)
        concatenate_model = Dense(200, name='Output2')(concatenate_model)
        concatenate_model = LeakyReLU(alpha=0.3)(concatenate_model)
        concatenate_model = Dense(100, name='Output3')(concatenate_model)
        concatenate_model = LeakyReLU(alpha=0.3)(concatenate_model)
        concatenate_model = Dense(24, name='Output4')(concatenate_model)

        self.model = Model(inputs=[
            inTen_1,
            inTen_2,
            inTen_3,
            inTen_4,
            inTen_5,
            inTen_6,
            inTen_7,
            inTen_8,
            inTen_9], outputs=concatenate_model)


        
        plot_model(self.model, to_file='model_9_plot.png', show_shapes=True, show_layer_names=True)
        #OPT = Adam(lr=0.0001)
        self.model.compile(loss="mse", optimizer="ADAM", metrics=["mse"])

        self.history = self.model.fit([
            self.Y_train[:,0:51],
            self.Y_train[:,51:102],
            self.Y_train[:,102:153],
            self.Y_train[:,153:204],
            self.Y_train[:,204:255],
            self.Y_train[:,255:306],
            self.Y_train[:,306:357],
            self.Y_train[:,357:408],
            self.Y_train[:,408:459]],
            self.X_train,
            validation_data=([
            self.Y_test[:,0:51],
            self.Y_test[:,51:102],
            self.Y_test[:,102:153],
            self.Y_test[:,153:204],
            self.Y_test[:,204:255],
            self.Y_test[:,255:306],
            self.Y_test[:,306:357],
            self.Y_test[:,357:408],
            self.Y_test[:,408:459]],
            self.X_test),
            epochs=20000,
            batch_size=100,
            verbose=1,
        )


    def plot_training_metrics(self, save=False):
        """Plots the training and validation loss
        """
        loss = self.history.history["loss"]
        val_loss = self.history.history["val_loss"]
        acc = self.history.history["mse"]
        val_acc = self.history.history["val_mse"]

        plt.figure(figsize=(12, 6), dpi=100, facecolor="w", edgecolor="k")
        plt.plot(np.sqrt(loss), label='Train Loss')
        plt.plot(np.sqrt(val_loss), label='Validation Loss')
        plt.plot(acc, label='Train Mse')
        plt.plot(val_acc, label='Validation Mse')
        plt.title("MODEL LOSS AND ACCURACY")
        plt.ylabel("sqrt(MSE) / Accuracy")
        plt.xlabel("Epoch")
        plt.grid()
        plt.legend(loc="upper left")

        if save:
            fig_name = "training_loss.png"
            plt.savefig(self.dir + "/" + fig_name)
        else:
            plt.show()



    def score(self):
        scores = self.model.evaluate([
            self.Y_test[:,0:51],
            self.Y_test[:,51:102],
            self.Y_test[:,102:153],
            self.Y_test[:,153:204],
            self.Y_test[:,204:255],
            self.Y_test[:,255:306],
            self.Y_test[:,306:357],
            self.Y_test[:,357:408],
            self.Y_test[:,408:459]],
            self.X_test)
        # evaluate the model
        print("\n\n")
        print("\n*   *   *   Model Evaluate   *   *   *")
        print("\n%s: %e" % (self.model.metrics_names[0], scores[0]))
        print("\n%s: %e" % (self.model.metrics_names[1], scores[1]))
        print("\n\n")


    def save_model(self):
        # save model and architecture to single file
        self.model.save("directDeepLearningModel_single_model.h5")
        print("Saved direct deep learning model to disk")


    def predict(self):
        predictResponse = self.model.predict([
            self.Z_target[:,0:51],
            self.Z_target[:,51:102],
            self.Z_target[:,102:153],
            self.Z_target[:,153:204],
            self.Z_target[:,204:255],
            self.Z_target[:,255:306],
            self.Z_target[:,306:357],
            self.Z_target[:,357:408],
            self.Z_target[:,408:459]],
            batch_size=None,
            verbose=0,
            steps=None,
            callbacks=None,
            max_queue_size=10,
            workers=1,
            use_multiprocessing=False)


        predictResponse_csv = predictResponse
        np.savetxt('predictResponse.csv', predictResponse_csv, fmt='%s', delimiter=',')




def run_Direct_Network():

    # Run Direct Network
    directNetwork = Direct_network()
    directNetwork.baseline_model()
    directNetwork.score()
    directNetwork.plot_training_metrics()
    #directNetwork.save_model()
    directNetwork.predict()


def run_Target_Response():
    pass


def main():

    run_Direct_Network()
    run_Target_Response()

if __name__ == "__main__":
    main()
