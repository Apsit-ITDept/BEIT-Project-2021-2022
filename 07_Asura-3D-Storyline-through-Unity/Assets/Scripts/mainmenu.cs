using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class mainmenu : MonoBehaviour{

    public void loadLevel1()
    {
        //SceneManager.LoadSceneAsync("1");
    }
    
    public void QuitGame ()
        {
            Debug.Log("Quit");
            Application.Quit();
        }
}
