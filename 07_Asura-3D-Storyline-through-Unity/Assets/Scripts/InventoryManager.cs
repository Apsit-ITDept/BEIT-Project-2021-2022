using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class InventoryManager : MonoBehaviour
{
    public GameObject inventoryCanvas;
    bool active = false;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            if (active)
            {
                inventoryCanvas.SetActive(false);
                active = false;
            }
            else
            {
                inventoryCanvas.SetActive(true);
                active = true;
            }
                
        }
    }
}
