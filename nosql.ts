
interface ItemsInCollection {
    [key : string] : any
}

//what if we wanted to create new collection 

interface Collections { 
    [ CollectionName : string ] : ItemsInCollection[]
}

class ContractTs { 
    public Collections : Collections ; 

    constructor(targetCollection : string){
        // this.Collections[targetCollection] = [this.Collections[targetCollection]];
    }

     OnGetAllDocumentsValues(targetCollection : string) {
        //getting all values in any collections
        const res = this.Collections[targetCollection].map((item : ItemsInCollection)=> { 
            return item.value 
        })
        return res
    }

    OnGetDocumentvalue(targetCollection : string , key : string  ){
        //getting list of value in specific collection name that have key that match with target key 
        const res = this.Collections[targetCollection].filter((item : ItemsInCollection) => {
            if (item.key === key) {
                return item.value
            }
        })
    }

    public OnCreateDocument(collectionName : string ,key : string , value : any ){ 
        // creating new values in specific collection name and key
        // check for case key must never exist 
        // if (!this.Collections[collectionName][docIndex][key]) {
        this.Collections[collectionName].push({key : key , value : value}) 
        // !this.Collections[docIndex][key] ? this.collectionName[docIndex].push({key : key , value : value}) : null
    }

    OnUpdateDocument(collectionName : string , key : string, value : any ) {
        //update value for all key in collection name 
        this.Collections[collectionName].map((item : ItemsInCollection) => {
            return item.key === key ? item.value = value : item 
        })
        // this.Collections[collectionName].map((item : ItemsInCollection) => item.key === key ? item.value = value : item)
    }

    OnDeleteDocument(collectionName : string  , key : string , docIndex : number ){
        // delete all value that have key that match with target key 
        this.Collections[collectionName][docIndex] = this.Collections[collectionName][docIndex].filter((item : ItemsInCollection) => {
            return item.key !== key
        })
    }

    // more feature
    OnMoveDocumentToOther(fromCollectionName : string ,toCollectionName : string ,docIndex : number) {
        // swap value for all key in collection name 
        const lenght = this.Collections[fromCollectionName].length
        const temp = [...this.Collections[fromCollectionName].slice(0,docIndex),...this.Collections[toCollectionName].slice(docIndex,lenght+1)]
        this.Collections[fromCollectionName] = temp
        const currentPayload = this.Collections[fromCollectionName][docIndex]
        this.Collections[toCollectionName].push(currentPayload)
    }

    OnSeeAllLogs(){
        // see all logs in all collections
        console.log(this.Collections)
    }
}

const contract = new ContractTs('user')

contract.OnCreateDocument('user','name','jonh')
contract.OnCreateDocument('admin','status',200)

contract.OnGetAllDocumentsValues('user')



// contract.OnCreateDocument('user','age',0,20)
contract.OnSeeAllLogs()

