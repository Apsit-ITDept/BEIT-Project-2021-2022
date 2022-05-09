using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class puzzle : Interactable
{
    public GameObject _puzzle;
    Animator anim;
    void Start()
    {
        //wm = GameObject.FindGameObjectWithTag("Player").GetComponent<WeaponManager>();
        anim = GetComponentInChildren<Animator>();
    }
    public override string GetDescription()
    {
        return "Press [E] to view puzzle.";
    }

    public override void Interact()
    {
        anim.SetBool("activate", true);
        _puzzle.SetActive(true);
    }
}
