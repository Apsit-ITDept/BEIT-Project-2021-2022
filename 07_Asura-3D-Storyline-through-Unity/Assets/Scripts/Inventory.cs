using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{

    #region Singleton
    public static Inventory instance;
    void Awake ()
    {
        if(instance != null)
        {
            Debug.LogWarning("More thsn one instance of Invemtory found!");
            return;
        }

        instance = this;
    }

    #endregion

    public delegate void OnItemChanged();
    public OnItemChanged onItemChangedCallback;

    public int space = 20; 
    public List<Item> items = new List<Item>();
    public bool Add (Item item)
    {
        if(!item.isDefaultItem)
        {
            if(items.Count >= space )
            {
                Debug.Log("Not enough room");
                return false;
            }
            items.Add(item);
            
            

        }
        return true;
    }
    public void Remove(Item item)
    {
        items.Remove(item);
        if(onItemChangedCallback != null)
            {
                onItemChangedCallback.Invoke();
            }
    }
}
