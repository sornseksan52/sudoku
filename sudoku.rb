def Show_Data(r,c)#prin Data
	$x = $y = 0
	puts "\n\t********** Sudoku **********"
	puts "\t+--------+--------+--------+"
	while  $x < r
		print "\t"
		while $y < c
			print "|"
			print $data[$x][$y]
			print " "
			$y += 1
		end
		if $x % 3 == 2
			print "|\n"
			puts "\t+--------+--------+--------+"
		else
			print "|\n"
		end
		$x += 1
		$y = 0
	end
	puts "\n----------------------------------------------------"
end

def Check_Data_row(data1,row1,col1,ch_row1,ch_col1) #Check Data Row&Col
	puts " Array[#{ch_row1}][#{ch_col1}] = #{data1}"
	
	$ch_count_row = $ch_count_col = $row_check = $col_check = $a = $b =0
	$col2 = $row2 = $row_check1 = $col_check1 = 0
	
	while $ch_count_row < row1
		
		$check_data_row = $data[ch_row1][$ch_count_row]

		if $check_data_row == data1
			$Check_Data_row = 0
			$row_check = 1
			break
		else
			$row_check = 0
			$ch_count_row += 1	
		end

	end
	
	while $ch_count_col < col1
		
		$check_data_col = $data[$ch_count_col][ch_col1]
		
		if $check_data_col == data1
			$col_check = 1
			break
		else
			$col_check = 0
			$ch_count_col += 1	
		end

	end

	if ($row_check == 0) && ($col_check == 0)
		$data[ch_row1][ch_col1] = data1
	end	
end

def Data_stop(row3,col3)
	$count3 = 0
	@R = row3
	@C = col3
	
	(0...@R).each do |q|
		(0...@C).each do |w|
			if $data[q][w] != 0
				$count3 += 1
			else
				break
			end

		end
	end

	if ($count3 == row3**2)
		return true 
	else
		return false
	end

end
puts "---------------------Games Sudoku-------------------\n"

begin
	print "input row = "
	$row = Integer(gets.chomp)
	print "input collum = "
	$col = Integer(gets.chomp)
end until $row == $col && ($row > 1 && $col > 1)
	
	$data = Array.new($row) { Array.new($col)}
		(0...$row).each do |i|
			(0...$col).each do |j|	
				$data[i][j] = 0
			end	
		end	
	Show_Data($row,$col)
	
	while Data_stop($row,$col) != true
		begin
			begin
				puts "Select Array[row][collum] = ? "
				print " number row =  "
				num_row = Integer(gets.chomp)
				print " number Collum = "
				num_col = Integer(gets.chomp)
				$data[num_row][num_col]	
			end until $data[num_row][num_col] == 0 

	   		print " Input Data = "
	   		num = Integer(gets.chomp)
	  
	   		if num <= $row
	   			Check_Data_row(num,$row,$col,num_row,num_col)
	   		end
		end until(num <= $row || num >= 1) 
		Show_Data($row,$col)
	end
	print "\n\tSuccess! You Win?\n"






