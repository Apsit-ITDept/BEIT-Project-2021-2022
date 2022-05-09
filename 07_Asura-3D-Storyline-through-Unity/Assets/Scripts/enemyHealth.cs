using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityStandardAssets.Characters.ThirdPerson;

public class enemyHealth : MonoBehaviour
{
    public int maxhp = 100;
    int hp;
    gameManager gm;
    Animator anim;
    public bool isDead = false;
    public Slider healthSlider;
    
    // Start is called before the first frame update
    void Start()
    {
        hp = maxhp;
        //gm = GameObject.FindGameObjectWithTag("GameController").GetComponent<gameManager>();
        anim = GetComponent<Animator>();        
    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log(hp);
        healthSlider.value = hp;
    }
    public void addDamage(int damage)
    {
        if (hp > 0)
        {
            hp -= damage;
            anim.SetTrigger("Hit");
        }       
        if (hp <= 0)
        {
            if (!isDead)
            {
                anim.SetTrigger("Dead");
                var n = GetComponent<UnityEngine.AI.NavMeshAgent>();
                var a = GetComponent<AICharacterControl>();
                a.enabled = false;
                n.isStopped=true;
                Invoke("_Destroy", 5.0f);
                isDead = true;
            }            
        }
    }
    public void addHealth(int hpbonus)
    {
        hp += hpbonus;
        if (hp > maxhp)
        {
            hp = maxhp;
        }
    }
    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Weapon")
        {
            Debug.Log("Collision");
            int dmg = other.GetComponent<weaponDamage>().Damage;
            addDamage(dmg);
        }
    }
    public void _Destroy()
    {
        Destroy(gameObject);
    }
}
