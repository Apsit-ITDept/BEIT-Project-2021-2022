using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class extraHealth : Interactable
{
    void Start()
    {
        //wm = GameObject.FindGameObjectWithTag("Player").GetComponent<WeaponManager>();
    }
    public override string GetDescription()
    {
        return "Press [E] to Pick Up.";
    }

    public override void Interact()
    {
        Destroy(gameObject);
    }
}
    

