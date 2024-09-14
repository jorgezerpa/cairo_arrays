#[derive(Copy, Drop)]
enum Data {
    Integer:u128,
    Felt:felt252,
    Tuple:(u32, u32)
}


fn main(){
    let mut arr = ArrayTrait::new(); // like a queue -> FIFO
    arr.append(0);
    arr.append(1);
    arr.append(2);
    let first_value_of_arr = arr.pop_front().unwrap();
    println!("{}", first_value_of_arr); // 0 and removes it
    println!("{}", arr[0]); // 1
    println!("{}", arr.at(0)); // 1 (in an snapshot)


    // if you are not sure the value exists, use get:
    let first_value = match arr.get(0){ // snapshot to
        Option::Some(x) => {
            *x.unbox()
        },
        Option::None => { panic!("out of bounds") }
    };
    println!("first value {}", first_value);
    

    // to create it empty (i.e -> add values on running time), you have to specify the type of the items
    let _arr2 = ArrayTrait::<u128>::new();
    let _arr3:Array<u128> = ArrayTrait::new();

    println!("arr2 length is: {}", _arr2.len());
    println!("arr3 is empty? {}", _arr2.is_empty());



    // IF YOU KNOW VALUES ON COMPILATION TIME
    let _arr_in_compilation = array![0,1,2]; // equal to set an array and then append its values


    // lastly, you can use enums (we'll focus more on this later)
    // to create an array with multiple data types 
    let mut multiple_types_array: Array<Data> = array![];
    multiple_types_array.append(Data::Integer(100));
    multiple_types_array.append(Data::Integer(21));
    multiple_types_array.append(Data::Felt('Hello arr!'));
    multiple_types_array.append(Data::Tuple((10,20)));


}