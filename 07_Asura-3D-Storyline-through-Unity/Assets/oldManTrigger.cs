using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class oldManTrigger : MonoBehaviour
{
    public GameObject panel;
    public GameObject healthOrb;
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            panel.SetActive(true);
            healthOrb.SetActive(true);
            Destroy(gameObject);
        }
    }
}
