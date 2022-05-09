using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sword : Interactable
{
    WeaponManager wm;
    void Start()
    {
        wm = GameObject.FindGameObjectWithTag("Player").GetComponent<WeaponManager>();
    }
    public override string GetDescription()
    {
        return "Press [E] to pick up.";
    }

    public override void Interact()
    {
        wm.unlock[7] = true;
        Destroy(gameObject);
    }
}
