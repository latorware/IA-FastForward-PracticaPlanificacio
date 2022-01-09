import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class generadorProblemExtension2 {


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

        File myObj = new File("ProblemExtension2.pddl");
        FileWriter myWriter = new FileWriter("ProblemExtension2.pddl");
        myWriter.write("(define (problem ProblemExtension2)\n");
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
        myWriter.write("        ");
        myWriter.write("nort sud est oest - orientacion\n");
        myWriter.write("    )\n");
        myWriter.write("    (:init\n");
        for (int i = 0; i < habitacions; i++) {
            myWriter.write("        (= (maxPersonas " + "habitacio" + i + ") " + randomnumberrr(1,4) + ")\n");
            int orientadaA = randomnumberrr(1, 4); 
            String orientadaAA = null; 
            if (orientadaA == 1) {
                orientadaAA = "nort"; 
            }
            else if (orientadaA == 2) {
                orientadaAA = "sud"; 
            }
            else if (orientadaA == 3) {
                orientadaAA = "est"; 
            }
            else if (orientadaA == 4) {
                orientadaAA = "oest"; 
            }
            myWriter.write("        (orientadaA " + orientadaAA + " habitacio" + i    + ")\n");
        }
        for (int i = 0; i < reserves; i++) {
            myWriter.write("        (= (personas " + "reserva" + i + ") " + randomnumberrr(1,4) + ")\n");
            int peticionOrientacion = randomnumberrr(1, 4); 
            String peticionOrientacionn = null; 
            if (peticionOrientacion == 1) {
                peticionOrientacionn = "nort"; 
            }
            else if (peticionOrientacion == 2) {
                peticionOrientacionn = "sud"; 
            }
            else if (peticionOrientacion == 3) {
                peticionOrientacionn = "est"; 
            }
            else if (peticionOrientacion == 4) {
                peticionOrientacionn = "oest"; 
            }
            myWriter.write("        (peticionOrientacion " + peticionOrientacionn + " reserva" + i    + ")\n");
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
        myWriter.write("        (= (reservas_asignadas) 0)\n");
        myWriter.write("        (= (assignadas_con_orientacion) 0)\n");
        myWriter.write("    )\n");
        myWriter.write("    (:goal (forall (?x - reserva) (assignada ?x)))\n");
        myWriter.write("    (:metric maximize (+ (* 2 (reservas_asignadas)) (assignadas_con_orientacion)))\n");
        myWriter.write(")\n");




        myWriter.close();
    }
}