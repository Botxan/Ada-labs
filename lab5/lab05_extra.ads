with Laboratorio05;
use Laboratorio05;
package Lab05_Extra is
   procedure Num_Misterioso(Num:out String);
   --Post Num es el numero de 10 cifras que cumple todas las condiciones del enunciado

   procedure Incluir_Digito_Control(Tarjeta: in out T_Vector16);
   --Pre: TArjeta es un vector con los 15 primeros dígitos definidos
   --Post: TArjeta tiene el dígito 16 acorde a los 15 primeros

   function Es_Correcta(Tarjeta: in T_Vector16) return Boolean;
   --Pre: Tarjeta es un vector con 16 dígitos
   --Post: REsultado = true <--> Tarjeta es un número válido de tarjeta de crédito

   procedure Incluir_Digitos_IBAN(Pais: in String; BAnco, Sucursal: in Integer; Numero_Cuenta: T_Vector10;
      IBAN: out STRING);
   --Pre: Pais es el código del PAís con dos letras mayúsculas: ES, FR, IT, IE, DE...
   --     Banco es un número que identifica al BAnco y Sucursal a la sucursal de ese banco
   --     Numero_cuenta es un número de 10 dígitos que identifica a una cuenta en el banco indicado
   --Post: IBAN contiene los 24 caracteres que identifican en Europa a la cuenta indicada, incluyendo los dígitos de control
end Lab05_Extra;

