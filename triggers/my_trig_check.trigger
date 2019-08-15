trigger my_trig_check on Contact (before insert) {
    
    if(Trigger.isInsert)//to check the if insert or other dml,and to execute specific block.
    {
        
    }
}
/*
 * Trigger .....(After Insert,After Update,Before Insert)
* Trigger testing_trig on contact(AFter INsert,After Update){}
 * 
 * 
 * */