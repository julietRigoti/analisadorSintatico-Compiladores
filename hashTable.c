#include "hashTable.h"

void initialization(HashEntry *H[])
{
    int i;
    for (i = 0; i < TAM; i++){
        H[i] = NULL;
    }
}

int hash(char* name) {
    int sum = 0;
    for (int i = 0; name[i] != '\0'; i++) {
        sum += name[i];
    }
    return sum % TAM;
}

HashEntry *createSlot(char *name, int len, int type, int line){
    HashEntry * entry = (HashEntry *)malloc(sizeof(HashEntry));
    entry->lineno = line;
    entry->type = type;
    entry->prox = NULL;
    strncpy(entry->name, name, len);

    return entry;
}

int SearchToken(HashEntry *H[], char *name){
    int index = hash(name);
    HashEntry *aux = H[index];

    while(aux != NULL && strcmp(aux->name, name)){
        aux = aux->prox;
    }
    if(aux == NULL)
        return -1;
    else
        return index;
}

void inserts(HashEntry *H[], char *name, int len, int type, int line){
    int index = hash(name);
    HashEntry *entry = H[index];

    if(SearchToken(H, name) >= 0){
        printf("Este token já está na tabela\n\n");
    }
    else if (H[index] == NULL){
        // A lista encadeada está vazia, então crie uma nova entrada
        H[index] = createSlot(name, len, type, line);
        printf("Inserido '%s' pela primeira vez na linha: %d\n\n", name, line);
    }
}

