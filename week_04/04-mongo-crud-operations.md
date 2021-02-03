# Mongo CRUD operations

## CRUD?
- Create
- Read
- Update
- Delete

```
For this lesson, we will be focusing on the Read operations
```

## Object?
Mongo is based on Javascript, and the documents in mongo are in JSON (JavaScript Object Notation).
Therefore the word object will be used constantly arount the MongoSphere.

For us, that use primarily Python, we should translate a JS object as a Python Dictionary.

## READ
Mongo read queries are composed of 5 basic elements, or parameters we can use to accurally get the results we want:

- filter
- project
- sort
- skip
- limit

### skip & limit

Just set a value for how many documents you wish to skip and how many you want to see.

### sort
- Sorting Ascendingly
> We pass a `dictionary` with the attribute we want to sort by as key and a 1 as value.
>```js
>{age:1}
>```

- Sorting Descendingly
> We pass a dictionary with the attribute we want to sort by as key and a -1 as value.
>```js
>{age:-1}
>```

- Sorting by multiple attributes
> We pass a dictionary with the attributes we want to sort by as key and 1 or -1 as value.
>```js
>{age:1, name:-1}
>```

### project
- Select attributes we want to `include`
> Pass a dictionary with attribute as key and 1 as value
>```js
>{age:1, name:1}
>````

- Select attributes we want to `hide`
>```js
>{age:0, dni:0}
>```

- Warning ⚠️: We cannot mix inclusive or excludent projections.
> Use only either ones or zeroes on the projection.

### filter

This is how we actually query for the documents relevant for our search.

## Literal Search
Search for an `exact` value
> {year: 1978}
You can use multiple attributes
> {title:"Snow White", year:1916}

## Operators
- Mongo operators begin with `$`
### Comparison operators
`$lt $lte $gt $gte $eq $ne`
> ### `$eq` : `==`  (equal)
>> Can be omitted in most cases, since literal searches mean the same.

> ### `$ne` : `!=`  (not equal)
>> ```js
>>{ 
>>  year : 1916, 
>>  title: { $ne : "The Abandonment" } 
>>}

> ### `$lt` : `<`   (less than)
>> ```js
>> { year : { $lt : 1961 } }

> ### `$lte` : `<=`   (less than or equal to)

> ### `$gt` : >   (greater than)
>> ```js
>> { year : { $gt : 1950 } }

> ### `$gte` : >=   (greater than or equal to)

> ### `multiple` operators for a same attribute
>> ```js
>> {
>>  year : { $gt : 1950 , $lt : 1961 }
>>  }

### Logic Operators
These (`$and, $or`) have a slightly different syntax and require an array of conditions as value:
```javascript
{
    $operator: [
                    {condition 1},
                    {condition 2},
                    ... ,
                    {condition 3}
                ]
}
```
> `$and`
>> Can be omitted most of the time
>> ```js
>> { $and : [
>>              {year:{$gt:1950}}, 
>>              {year:{$lt:1961}}
>>          ]
>>  } 
>>```
>> It is the same as:
>> ```js
>> { year : { $gt:1950, $lt:1961 } }

> `$or`
>> ```js
>> { $or: [ 
>>          {title:"Snow White"}, 
>>          {year:1987}
>>        ]
>>}

> `$not`
>> ```js
>> { year : { $not : { $gte : 1987 } } }

- Querying for multiple values
> `$in`
>>```js
>> { title : { $in : ["Snow White", "Pocahontas"] } }

- Querying arrays
```js
{
    attribute: {
        $elemMarch : {condition1, condition2, ...}
    }
}
```
>> ```js
>> { cast : 
>>     { $elemMatch: {$eq: "Robert De Niro"} }
>> }


- Regex
>> ```js
>> { title : { $regex : ".*[Ss]now.*" } }




### SQL - Mongo Parallel

>SELECT       -> project

>WHERE        -> filter

>ORDER BY     -> sort

>LIMIT        -> skip, limit

## More
Checkout this great mongo query cheatsheet
- [Cheatsheet](mongo_operators_cheatsheet.png)