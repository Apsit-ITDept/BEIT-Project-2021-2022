using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Elevator : MonoBehaviour
{
    Animator am;
    public void Start()
    {
        am = GetComponent<Animator>();
    }
    public void onLever()
    {
        am.SetBool("pushed", true);
    }
}
