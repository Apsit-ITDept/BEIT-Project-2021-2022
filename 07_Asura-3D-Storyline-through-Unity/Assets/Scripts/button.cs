using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class button : Interactable
{
    public GameObject portalFrame;
    Animator anim;
    void Start()
    {
        anim = GetComponent<Animator>();
    }
    public override string GetDescription()
    {
        return "Press [E] to press button.";
    }

    public override void Interact()
    {
        anim.SetTrigger("ButtonPress");
        portalFrame.SetActive(true);
    }
}
