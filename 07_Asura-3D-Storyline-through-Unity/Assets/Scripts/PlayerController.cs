/*using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


[RequireComponent(typeof(PlayerMotor))]
public class PlayerController : MonoBehaviour
{
    public LayerMask Movementmask;
    Camera cam;
    PlayerMotor motor;
    public Interactable focus;
   
    
    // Start is called before the first frame update
    void Start()
    {
        motor = GetComponent<PlayerMotor>();
        cam = Camera.main;
      
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if(Physics.Raycast(ray, out hit, 100, Movementmask))
            {
                motor.MoveToPoint(hit.point);
                RemoveFocus();
            }
        }
        if (Input.GetMouseButtonDown(1))
        {
            Ray ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, 100))
            {
                Interactable interact = hit.collider.GetComponent<Interactable>();
                if(interact != null)
                {
                    setFocus(interact);
                }
            }
        }
    }
    void setFocus(Interactable newFocus)
    {
        if (newFocus != focus)
        {
            if (focus != null)
            {
                focus.defocused();
            }
            
            focus = newFocus;
            motor.followTarget(newFocus);

        }
        
        newFocus.Onfocused(transform);
        
        
    }
    void RemoveFocus()
    {
        if (focus != null)
        {
            focus.defocused();
        }
        
        focus = null;
        motor.StopFollowingTarget();
    }
}
*/