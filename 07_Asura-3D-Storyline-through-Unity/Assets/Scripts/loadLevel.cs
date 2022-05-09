using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class loadLevel : MonoBehaviour
{
    public GameObject loadingScreen;
    public Slider slider;
    public string levelName;
    public void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            //SceneManager.LoadSceneAsync(levelName);
            levelLoad(levelName);
            
        }
    }
    public void levelLoad(string lvlname)
    {
        StartCoroutine(LoadAsynchronously(lvlname));
    }
    IEnumerator LoadAsynchronously (string lvlname)
    {
        AsyncOperation operation = SceneManager.LoadSceneAsync(levelName);
        loadingScreen.SetActive(true);
        while (!operation.isDone)
        {
            float progress = Mathf.Clamp01(operation.progress / .9f);

            slider.value = progress;
            yield return null;
            }
    }
}
