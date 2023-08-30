function restore --argument file
    mv $file (echo $file | sed s/.bak//)
end
