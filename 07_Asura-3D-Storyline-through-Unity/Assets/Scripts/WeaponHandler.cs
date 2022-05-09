using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum WeaponAim
{
    NONE,
    SELF_AIM,
    AIM
}

public enum WeaponFireType
{
    SINGLE,
    MULTIPLE
}

public enum WeaponBulletType
{
    BULLET,
    ARROW,
    SPEAR,
    NONE
}

public class WeaponHandler : MonoBehaviour
{
    private Animator anim;
    public WeaponAim weapon_aim;

    [SerializeField]
    private GameObject muzzleFlash;

    [SerializeField]
    private AudioSource shootsound, reload_Sound;

    public WeaponFireType firetype;
    public WeaponBulletType bulletType;
    public GameObject attack_point;

    void Awake()
    {
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            ShootAnimation();
        }
        if (Input.GetKeyDown(KeyCode.W) || Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.S) || Input.GetKeyDown(KeyCode.D))
        {
            anim.SetBool("iswalking", true);
        }
        if (!Input.GetKey(KeyCode.W) && !Input.GetKey(KeyCode.A) && !Input.GetKey(KeyCode.S) && !Input.GetKey(KeyCode.D))
        {
            anim.SetBool("iswalking", false);
        }
    }
    // Start is called before the first frame update
    public void ShootAnimation()
    {
        Debug.Log("Shoot");
        anim.SetTrigger("Shoot");
    }
    public void Aim(bool canAim) 
    {
        anim.SetBool("Aim",canAim);
    }
    void Turn_On_MuzzleFlash()
    {
        muzzleFlash.SetActive(true);
    }
    void Turn_Off_MuzzleFlash()
    {
        muzzleFlash.SetActive(false);
    }
    void Play_ShootSound()
    {
        shootsound.Play();
    }
    void Play_ReloadSound()
    {
        reload_Sound.Play();
    }
    void Turn_On_AttackPoint()
    {
        attack_point.GetComponent<Collider>().enabled = true;
    }
    void Turn_Off_AttackPoint()
    {
        attack_point.GetComponent<Collider>().enabled = false;
    }
}
