using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class health : MonoBehaviour
{
    public int maxhp = 100;
    public Slider slider;
    int hp;
    gameManager gm;
    // Start is called before the first frame update
    void Start()
    {
        hp = maxhp;
        gm = GameObject.FindGameObjectWithTag("GameController").GetComponent<gameManager>();
    }

    // Update is called once per frame
    void Update()
    {
        slider.value = hp;
        //Debug.Log(hp);
    }
    public void addDamage(int damage)
    {
        hp -= damage;
        if (hp <= 0)
        {
            gm.gameOver();
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
}
