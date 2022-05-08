import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.*;
public class adaptive{
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        //JSONParser parser = new JSONParser();
        try (Reader reader = new FileReader("questions.json")) 
        {
            int count=5;
            String Difficulty="Normal";

            label:
            {
                Object question = new JSONParser().parse(reader);
                System.out.println("Difficulty is:"+Difficulty);
                
                String queString= question.get("Question");
                System.out.println(queString);
                System.out.println("Your Answer: ");
                String uAnswer=sc.nextLine();
                String ansString= question.get("Answer");
                System.out.println("The answer is: "+ansString);

                if (uAnswer!=ansString)
                {
                    count--;
                    if (count==0)
                        Difficulty="Easy";
                    else 
                        continue label;
                }
                else if (uAnswer==ansString)
                {
                    count++;
                    if (count==10)
                        Difficulty="Hard";
                    else 
                        continue label;
                }
                    count=0;
            }

        } 
        catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        

        
    }
}