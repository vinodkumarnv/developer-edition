public class QuestionAnswerClass
{
    @AuraEnabled
    public static List<Question__c> getQuestionAnswers()
    {
        List<Question__c> lstQues = [SELECT Name, QuestionText__c, 
                                    (SELECT Name, Option__c, Correct_Answer__c FROM Answers__r)
                                    FROM Question__c];
        return lstQues;

    }   
}