using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    private CharacterController character_Controller;
    private Vector3 move_Direction;
    public float speed = 5f;
    private float gravity = 20f;
    public float jump_force = 10f;
    private float vertical_velocity;
    health hp;

    public float interactionDistance=100f;
    public TMPro.TextMeshProUGUI interactionText;
    public GameObject interactionHoldGO; // the ui parent to disable when not interacting
    public UnityEngine.UI.Image interactionHoldProgress; // the progress bar for hold interaction type
    public Camera cam;
    Animator anim;

    void Awake()
    {
        character_Controller = GetComponent<CharacterController>();
        hp = GetComponent<health>();
        //cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
        anim = GetComponent<Animator>();
    }



    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            GameObject openPanel = GameObject.FindGameObjectWithTag("closable");
            openPanel.SetActive(false);
        }
        MovePlayer();


        Ray ray = cam.ScreenPointToRay(new Vector3(Screen.width / 2f, Screen.height / 2f, 0f));
        RaycastHit hit;
        
        bool successfuHit = false;

        if(Physics.Raycast(ray,out hit, interactionDistance))
        {
            Debug.Log(hit.transform.gameObject.name);
            Interactable interactable = hit.collider.GetComponent<Interactable>();

            if (interactable != null)
            {
                HandleInteraction(interactable);
                interactionText.text = interactable.GetDescription();
                successfuHit = true;
            }
        }

        if (!successfuHit)
        {
            interactionText.text = "";
        }
    }

    void HandleInteraction(Interactable interactable)
    {
        KeyCode key = KeyCode.E;
        switch (interactable.interactionType) 
        {
            case Interactable.InteractionType.Click:
                if (Input.GetKeyDown(key))
                {
                    interactable.Interact();
                }
                break;
            case Interactable.InteractionType.Hold:
                if (Input.GetKey(key))
                {
                    interactable.IncreaseHoldTime();
                    if (interactable.GetHoldTime() > 1f) 
                    {
                        interactable.Interact();
                        interactable.ResetHoldTime();
                    }
                }
                else
                {
                    interactable.ResetHoldTime();
                }
                //interactionHoldProgress.fillAmount = interactable.GetHoldTime();
                break;
            case Interactable.InteractionType.Minigame:
                // here you make ur minigame appear
                break;
            default:
                throw new System.Exception("Unsupported type of interaction");
        }
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Enemy")
        {
            //Debug.Log("Collision");
            int dmg = other.GetComponent<EnemyDamage>().Damage;
            hp.addDamage(dmg);
        }
    }

    void MovePlayer()
    {
        move_Direction = new Vector3(Input.GetAxis("Horizontal"), 0f,
                                     Input.GetAxis("Vertical"));
        move_Direction = transform.TransformDirection(move_Direction);
        move_Direction *= speed * Time.deltaTime;
        ApplyGravity();
        character_Controller.Move(move_Direction);
    }
    void ApplyGravity()
    {
        if (character_Controller.isGrounded)
        {
            vertical_velocity -= gravity * Time.deltaTime;
            Playerjump();
        }
        else
        {
            vertical_velocity -= gravity * Time.deltaTime;
        }
        move_Direction.y = vertical_velocity * Time.deltaTime;
        
    }

    void Playerjump()
    {
        if(character_Controller.isGrounded && Input.GetKeyDown(KeyCode.Space))
        {
            vertical_velocity = jump_force;
        }
    }

}
