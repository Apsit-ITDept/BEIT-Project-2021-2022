using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lever : Interactable
{
    public Elevator portal;
    Animator anim;
    bool isOn = false;
    // Start is called before the first frame update
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    public override string GetDescription()
    {
        if(isOn!=true) return "Press [E] to activate.";
        return "";
    }

    public override void Interact()
    {
        isOn = true;
        anim.SetBool("LeverUp", true);
        portal.onLever();
    }
}
