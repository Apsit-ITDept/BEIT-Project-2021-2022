using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponManager : MonoBehaviour
{
    [SerializeField]
    private WeaponHandler[] weapons;
    public bool[] unlock;
    public GameObject swordLock;

    private int current_weapon_Index;
    // Start is called before the first frame update
    void Start()
    {
        current_weapon_Index = 0;
        weapons[current_weapon_Index].gameObject.SetActive(true);
        for(int i = 0; i < 7; i++)
        {
            unlock[i] = false;
        }
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log(this.gameObject.name);
        if (Input.GetKeyDown(KeyCode.Alpha0))
        {          
                TurnOnSelectWeapon(0);
        }
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            if (unlock[1])
            {
                TurnOnSelectWeapon(1);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            if (unlock[2])
            {
                TurnOnSelectWeapon(2);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            if (unlock[3])
            {
                TurnOnSelectWeapon(3);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha4))
        {
            if (unlock[4])
            {
                TurnOnSelectWeapon(4);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha5))
        {
            if (unlock[5])
            {
                TurnOnSelectWeapon(5);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha6))
        {
            if (unlock[6])
            {
                TurnOnSelectWeapon(6);
            }
        }
        if (Input.GetKeyDown(KeyCode.Alpha7))
        {
            if (unlock[7])
            {
                TurnOnSelectWeapon(7);
            }
        }
        if (unlock[7] == true)
        {
            swordLock.SetActive(false);
        }
        else
        {
            swordLock.SetActive(true);
        }
    }
    void TurnOnSelectWeapon(int weaponIndex)
    {
        if (current_weapon_Index == weaponIndex)
            return;
        weapons[current_weapon_Index].gameObject.SetActive(false);
        weapons[weaponIndex].gameObject.SetActive(true);
        current_weapon_Index = weaponIndex;
    }
    public WeaponHandler GetCurrentSelectedWeapon()
    {
        return weapons[current_weapon_Index];
    }
}
