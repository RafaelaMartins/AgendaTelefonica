program Trabalho1;
uses crt;

type Agenda = RECORD

	dia:integer;
	mes:integer;
	nome:string[30];
end;
	
var vet:ARRAY[1..15] of Agenda;
	Mes,Dia,i,x,op,Total,j:integer;
	Nome:string[10];
	aux:ARRAY[1..1] of Agenda;
	letra:char;

procedure Cadastrar;
begin
	
	Total:=Total+1;
	if(Total <= 15) then
		begin
			vet[Total].nome := Nome;
			vet[Total].dia := Dia;
			vet[Total].mes := Mes;
			writeln(vet[Total].nome,'--',vet[Total].dia,'/',vet[Total].mes);
		end;
		
	
end;	

procedure Excluir;
begin
	for i:= 1 to Total do 
	begin
		if(vet[i].nome = Nome) then
		begin
			for x:=i to Total-1 do
			begin
				vet[i]:=vet[i+1];
			end;
		end;	
	end;
			Total:=Total-1;
	
end;	

procedure Alterar;
begin
	for i:= 1 to Total do 
	begin
		if(vet[i].nome = Nome) then
		begin
			vet[i].dia := Dia;
			vet[i].mes:= Mes;
			break;
		end;	
	end;
	
end;

procedure Busca_Dia_Mes;
begin
	for i:=1 to Total do
	begin
		if((vet[i].dia = Dia)and(vet[i].mes = Mes)) then
		begin
			writeln('Nome:',vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
		end;
	end;
end;

procedure Busca_Mes;
begin
	for i:=1 to Total do
	begin
		if(vet[i].mes = Mes) then
		begin
			writeln('Nome:',vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
		end;	
	end;
end;

procedure Busca_Letra;
begin
	for i:=1 to Total do
	begin
		if(vet[i].nome[1] = letra) then
		begin
			writeln('Nome:',vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
		end;
	end;
end;

procedure Ordenar_Nome;
begin
	j:=0;
	for x:=1 to Total do
	begin
		for i:=1 to Total-1 do
		begin
		j:=i+1;
			if(vet[i].nome>vet[j].nome) then
			begin
				aux[1]:= vet[i];
				vet[i] := vet[j];
				vet[j] := aux[1];
				writeln(i);
			end;
		end;
	end;	
	
end;

procedure Ordenar_Mes;
begin
	j:=0;
	for x:=1 to Total do
	begin
		for i:=1 to Total-1 do
		begin
		j:=i+1;
			if(vet[i].mes>vet[j].mes) then
			begin
				aux[1]:= vet[i];
				vet[i] := vet[j];
				vet[j] := aux[1];
				writeln(i);
			end;
		end;
	end;	
end;


procedure Menu;
begin
	writeln('----------Menu---------');
	writeln(' ');
	writeln('1 - Adicionar');
	writeln('2 - Alterar');
	writeln('3 - Excluir');
	writeln('4 - Listar Aniversáriantes por Dia ou Mẽs');
	writeln('5 - Listar Aniversariantes por Mês');
	writeln('6 - Listar Aniversariantes por letra');
	writeln('7 - Mostrar toda a agenda ordenada pelo nome.');
	writeln('8 - Mostrar toda a agenda ordenada por mês.');
	writeln('9 - Sair');
	writeln(' ');
	writeln('-----------------------');
	writeln(' ');
	writeln('Digite sua opção');


end;


begin

Total:=0;
Mes:=0;
Dia:=0;
op:=10;
while(op<>9) do
begin
	Menu;
	readln(op);

	if op = 1 then
	begin
		writeln('digite o dia em que nasceu');
		readln(Dia);
		writeln('Digite o mês');
		readln(Mes);
		writeln('Digite o nome');
		readln(Nome);
		Cadastrar;
	end else if op = 2 then
		begin
			Dia:=00;
			Mes:=00;
			writeln('digite o novo dia em que a pessoa nasceu');
			readln(Dia);
			writeln('Digite o novo mês');
			readln(Mes);
			writeln('Digite o nome da pessoa a ser alterado');
			readln(Nome);
			Alterar;
			for i:=1 to Total do
				begin
					writeln(vet[i].nome,'--',vet[i].dia,'/',vet[i].mes,'.');
				end;
		end else if op = 3 then
			begin
				writeln('Digite o nome da pessoa a ser Excluido');
				readln(Nome);
				Excluir;
				for i:=1 to Total do
				begin
					writeln(vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
				end;
			end else if op = 4 then
				begin
					writeln('digite o dia ');
					readln(Dia);
					writeln('Digite o mês');
					readln(Mes);	
					Busca_Dia_Mes;
				end else if op = 5 then
					begin
						writeln('Digite o mês');
						readln(Mes);	
						Busca_Mes;
					end else if op = 6 then
						begin
						letra:=' ';
							writeln('Digite a letra');
							readln(letra);	
							Busca_Letra;
						end else if op = 7 then
						begin
							Ordenar_Nome;
							for i:=1 to Total do
							begin
								writeln(vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
							end;
						end else if op = 8 then
						begin
							Ordenar_Mes;
							for i:=1 to Total do
							begin
								writeln(vet[i].nome,'--',vet[i].dia,'/',vet[i].mes);
							end;
						end;
	end;					


readkey;
end.