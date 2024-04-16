#=======================================================================================================================
# TRABAJO PRACTICO 1 - BARRETO AGUSTIN ALEJANDRO
# CROWDAR ACADEMY - Basic Automation                                                        Fecha de entrega: 23/04/2024
#=======================================================================================================================

#Escenarios de Registro
@SingUp @EN
Feature: Crear una cuenta en Clockify


	Scenario Outline: Registrarse en Clockify exitosamente con una cuenta de email (<idioma>)
		Given El usuario navega a https://clockify.me/
		And esta en la pantalla de "Sing Up"
		When El usuario ingresa "agustinBarreto@prueba.com" en el campo de e-mail
		And acepta los terminos y condiciones
		And hace click en el boton "<btn_SingUp>"
		And ingresa el codigo que llega al email ingresado
		Then se crea la cuenta en Clockify
		And se muesta la pagina de inicio en Clockify

		@EN
		Examples:
			| idioma | btn_SingUp          |
			| EN     | CONTINUE WITH EMAIL |

	Scenario Outline: Registrarse en Clockify exitosamente con una cuenta de GOOGLE (<idioma>)
		Given El usuario navega a https://clockify.me/
		And esta en la pantalla de "Sing Up"
		And existe una cuenta google creada "Automation_Clockify@gmail.com"
		When El usuario acepta los terminos y condiciones
		And hace click en el boton "<btn_SingUp>"
		And selecciona la cuenta "Automation_Clockify@gmail.com"
		And hace click en el boton "Continue"
		Then se crea la cuenta en Clockify
		And se muesta la pagina de inicio en Clockify

		@EN
		Examples:
			| idioma | btn_SingUp           |
			| EN     | Continue with Google |


	Scenario Outline: Registrarse en Clockify exitosamente agregando una nueva cuenta de GOOGLE (<idioma>)
		Given El usuario navega a https://clockify.me/
		And esta en la pantalla de "Sing Up"
		When El usuario acepta los terminos y condiciones
		And hace click en el boton "<btn_SingUp>"
		And selecciona la opcion "Add new acount"
		And ingresa "Automation_Clockify@gmail.com" en el campo de email
		And hace click en el boton "Next"
		Then se crea la cuenta en Clockify
		And se muesta la pagina de inicio en Clockify

		@EN
		Examples:
			| idioma | btn_SingUp           |
			| EN     | Continue with Google |


	Scenario Outline: Verificar que un usuario no pueda Registrarse en Clockify con una cuenta de email con formato invalido (<idioma>)
		Given El usuario navega a https://clockify.me/
		And esta en la pantalla de "Sing Up"
		When El usuario ingresa "<email>" en el campo de e-mail
		And acepta los terminos y condiciones
		Then se muestra el mensaje <mensaje>
		And se verifica que el boton "<btn_SingUp>" no se habilita

		@EN
		Examples:
			| idioma | btn_SingUp          | mensaje                   | email | btn_SingUp          |
			| EN     | CONTINUE WITH EMAIL | Email is required         |       | CONTINUE WITH EMAIL |
			| EN     | CONTINUE WITH EMAIL | Email format is not valid | 1234  | CONTINUE WITH EMAIL |


	Scenario Outline: Verificar que un usuario no pueda Registrarse en Clockify sin aceptar los terminos y condiciones (<idioma>)
		Given El usuario navega a https://clockify.me/
		And esta en la pantalla de "Sing Up"
		When El usuario no acepta los terminos y condiciones
		Then se muestra el mensaje "<mensaje>"
		And se verifica que el boton "<btn_SingUp>" no se habilita
		And se verifica que el boton "<btn_SingUp_Google>" no se habilita

		@EN
		Examples:
			| idioma | btn_SingUp          | btn_SingUp_Google    | mensaje                              |
			| EN     | CONTINUE WITH EMAIL | Continue with Google | You must accept the terms of service |


#Escenarios de Login
	@Login @EN
	Feature: Login en Clockify







