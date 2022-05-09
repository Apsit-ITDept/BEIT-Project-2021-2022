using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class oldMan : Interactable
{
    public GameObject panel;
    //WeaponManager wm;
    void Start()
    {
        //wm = GameObject.FindGameObjectWithTag("Player").GetComponent<WeaponManager>();
    }
    public override string GetDescription()
    {
        return "Press [E] to talk.";
    }

    public override void Interact()
    {
        panel.SetActive(true);
    }
}
