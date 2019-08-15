trigger LazyEmployee on Case (Before insert) {
  
  for (Case a : Trigger.new) {
    a.Status = 'Closed';
  }
 
}