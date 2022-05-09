using System;
using UnityEngine;

namespace UnityStandardAssets.Characters.ThirdPerson
{
    [RequireComponent(typeof (UnityEngine.AI.NavMeshAgent))]
    [RequireComponent(typeof (ThirdPersonCharacter))]
    public class AICharacterControl : MonoBehaviour
    {
        public UnityEngine.AI.NavMeshAgent agent { get; private set; }             // the navmesh agent required for the path finding
        public ThirdPersonCharacter character { get; private set; } // the character we are controlling
        public Transform target;                                    // target to aim for
        public float targetDistance = 6f;

        public GameObject m_LeftFist;

        private void Start()
        {
            // get the components on the object we need ( should not be null due to require component so no need to check )
            agent = GetComponentInChildren<UnityEngine.AI.NavMeshAgent>();
            character = GetComponent<ThirdPersonCharacter>();

	        agent.updateRotation = false;
	        agent.updatePosition = true;

            target = GameObject.FindGameObjectWithTag("Player").transform;
        }

        public void activateArm()
        {
            m_LeftFist.GetComponent<Collider>().enabled = true;
        }

        public void deactivateArm()
        {
            m_LeftFist.GetComponent<Collider>().enabled = false;
        }


        private void Update()
        {
            if (target != null)
            {
                agent.SetDestination(target.position);
                transform.LookAt(target.position);
                //Debug.Log(agent.remainingDistance);

                if (agent.remainingDistance < targetDistance)
                {
                    GetComponent<Animator>().SetTrigger("Attack");
                }
            }
            if (agent.remainingDistance < 75f)
            {
                if (agent.remainingDistance > agent.stoppingDistance)
                    character.Move(agent.desiredVelocity, false, false);
                else
                    character.Move(Vector3.zero, false, false);
            }
            else
                character.Move(Vector3.zero, false, false);
        }


        public void SetTarget(Transform target)
        {
            this.target = target;
        }
    }
}
