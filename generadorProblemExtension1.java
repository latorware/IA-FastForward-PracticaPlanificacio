import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class generadorProblemExtension1 {


    public static int randomnumberrr (int lower, int upper) {
        Random random = new Random();
        int randomNumber = random.nextInt((upper - lower) + 1) + lower;
        return randomNumber; 
    }


    public static void main(String[] args) throws IOException {
        
        Scanner reader = new Scanner(System.in);
        System.out.println("Quantes habitacions vols que tingui el problema?");
        int habitacions = reader.nextInt();
        System.out.println("Quantes reserves vols que tingui el problema?");
        int reserves = reader.nextInt();

        File myObj = new File("ProblemExtension1.pddl");
        FileWriter myWriter = new FileWriter("ProblemExtension1.pddl");
        myWriter.write("(define (problem ProblemExtension1)\n");
        myWriter.write("    (:domain planificador)\n");
        myWriter.write("    (:objects\n");
        myWriter.write("        ");
        for (int i = 0; i < habitacions; i++) {
            myWriter.write("habitacio" + i + " ");
        }
        myWriter.write("- habitacion\n");
        myWriter.write("        ");
        for (int i = 0; i < reserves; i++) {
            myWriter.write("reserva" + i + " ");
        }
        myWriter.write("- reserva\n");
        myWriter.write("        ");
        for (int i = 1; i <= 30; i++) {
            myWriter.write("dia" + i + " ");
        }
        myWriter.write("- dia\n");
        myWriter.write("    )\n");
        myWriter.write("    (:init\n");
        for (int i = 0; i < habitacions; i++) {
            myWriter.write("        (= (maxPersonas " + "habitacio" + i + ") " + randomnumberrr(1,4) + ")\n");
        }
        for (int i = 0; i < reserves; i++) {
            myWriter.write("        (= (personas " + "reserva" + i + ") " + randomnumberrr(1,4) + ")\n");
        }
        for (int i = 0; i < reserves; i++) {
            int diainici; 
            int diafinal; 
            do {
                diainici = randomnumberrr(1, 30); 
                diafinal = randomnumberrr(1, 30); 
            } while (diainici >= diafinal);
            myWriter.write("        (= (inicio " + "reserva" + i + ") " + diainici + ")\n");
            myWriter.write("        (= (final " + "reserva" + i + ") " + diafinal + ")\n");
        }
        for (int i = 1; i <= 30; i++) {
            myWriter.write("        (= (numero " + "dia" + i + ") " + i + ")\n");
        }
        myWriter.write("    )\n");
        //myWriter.write("    (:goal (forall (?x - reserva) (assignada ?x)))\n");
        myWriter.write("    (:maximize (reservas_asignadas))\n");
        myWriter.write(")\n");




        myWriter.close();
    }
}