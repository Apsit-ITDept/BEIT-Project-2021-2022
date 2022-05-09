using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAnim : MonoBehaviour
{
    private Animator anim;
    void Awake()
    {
        anim = GetComponent<Animator>();
    }
    // Start is called before the first frame update
    public void Walk(bool walk)
    {
        anim.SetBool("Walk", walk);
    }
    public void Run(bool run)
    {
        anim.SetBool("Run", run);
    }
    public void Attack()
    {
        anim.SetTrigger("Attack");
    }
    public void Dead()
    {
        anim.SetTrigger("Dead");
    }
}
// Start is called before the first frame update

